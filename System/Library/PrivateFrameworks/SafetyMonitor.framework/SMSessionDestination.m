@implementation SMSessionDestination

- (SMSessionDestination)initWithCLLocation:(id)a3 eta:(id)a4 radius:(double)a5 destinationType:(unint64_t)a6 destinationMapItem:(id)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  double v29;
  double v30;
  void *v31;
  SMSessionDestination *v32;

  v12 = a7;
  v13 = a4;
  v14 = a3;
  if (objc_msgSend(v14, "type") == 1)
    v15 = 2;
  else
    v15 = 1;
  v16 = objc_alloc(MEMORY[0x24BE27EB0]);
  objc_msgSend(v14, "coordinate");
  v18 = v17;
  objc_msgSend(v14, "coordinate");
  v20 = v19;
  objc_msgSend(v14, "horizontalAccuracy");
  v22 = v21;
  objc_msgSend(v14, "altitude");
  v24 = v23;
  objc_msgSend(v14, "verticalAccuracy");
  v26 = v25;
  objc_msgSend(v14, "timestamp");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v14, "referenceFrame");
  objc_msgSend(v14, "speed");
  v30 = v29;

  v31 = (void *)objc_msgSend(v16, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:", v27, v28, v15, v18, v20, v22, v24, v26, v30);
  v32 = -[SMSessionDestination initWithLocation:eta:radius:destinationType:destinationMapItem:](self, "initWithLocation:eta:radius:destinationType:destinationMapItem:", v31, v13, a6, v12, a5);

  return v32;
}

- (SMSessionDestination)initWithLocation:(id)a3 eta:(id)a4 radius:(double)a5 destinationType:(unint64_t)a6 destinationMapItem:(id)a7
{
  id v13;
  id v14;
  id v15;
  SMSessionDestination *v16;
  SMSessionDestination *v17;
  objc_super v19;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)SMSessionDestination;
  v16 = -[SMSessionDestination init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_location, a3);
    objc_storeStrong((id *)&v17->_eta, a4);
    v17->_radius = a5;
    v17->_destinationType = a6;
    objc_storeStrong((id *)&v17->_destinationMapItem, a7);
  }

  return v17;
}

- (CLLocation)clLocation
{
  id v3;
  void *v4;
  double v5;
  CLLocationDegrees v6;
  void *v7;
  CLLocationDegrees v8;
  CLLocationCoordinate2D v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v3 = objc_alloc(MEMORY[0x24BDBFA80]);
  -[SMSessionDestination location](self, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latitude");
  v6 = v5;
  -[SMSessionDestination location](self, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "longitude");
  v9 = CLLocationCoordinate2DMake(v6, v8);
  -[SMSessionDestination location](self, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "altitude");
  v12 = v11;
  -[SMSessionDestination location](self, "location");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "horizontalUncertainty");
  v15 = v14;
  -[SMSessionDestination location](self, "location");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "verticalUncertainty");
  v18 = v17;
  -[SMSessionDestination location](self, "location");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionDestination location](self, "location");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v3, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:referenceFrame:", v20, objc_msgSend(v21, "referenceFrame"), v9.latitude, v9.longitude, v12, v15, v18);

  return (CLLocation *)v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMSessionDestination)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  SMSessionDestination *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMSessionDestinationLocationKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMSessionDestinationEtaKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("__kSMSessionDestinationRadiusKey"));
  v8 = v7;
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("__kSMSessionDestinationDestinationTypeKey"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMSessionDestinationDestinationMapItem"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[SMSessionDestination initWithLocation:eta:radius:destinationType:destinationMapItem:](self, "initWithLocation:eta:radius:destinationType:destinationMapItem:", v5, v6, v9, v10, v8);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SMSessionDestination location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("__kSMSessionDestinationLocationKey"));

  -[SMSessionDestination eta](self, "eta");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("__kSMSessionDestinationEtaKey"));

  -[SMSessionDestination radius](self, "radius");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("__kSMSessionDestinationRadiusKey"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SMSessionDestination destinationType](self, "destinationType"), CFSTR("__kSMSessionDestinationDestinationTypeKey"));
  -[SMSessionDestination destinationMapItem](self, "destinationMapItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("__kSMSessionDestinationDestinationMapItem"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;

  -[SMSessionDestination location](self, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SMSessionDestination eta](self, "eta");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[SMSessionDestination radius](self, "radius");
  v8 = (unint64_t)v7;
  v9 = v6 ^ -[SMSessionDestination destinationType](self, "destinationType");
  -[SMSessionDestination destinationMapItem](self, "destinationMapItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash") ^ v8;

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  SMSessionDestination *v4;
  SMSessionDestination *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  char v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  unint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;

  v4 = (SMSessionDestination *)a3;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SMSessionDestination location](self, "location");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "latitude");
      v8 = v7;
      -[SMSessionDestination location](v5, "location");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "latitude");
      v11 = v10;
      if (v8 != v10)
      {
        -[SMSessionDestination location](self, "location");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "latitude");
        v13 = v12;
        -[SMSessionDestination location](v5, "location");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "latitude");
        if (vabdd_f64(v13, v15) >= 2.22044605e-16)
        {
          v16 = 0;
          goto LABEL_29;
        }
        v46 = v14;
      }
      -[SMSessionDestination location](self, "location");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "longitude");
      v19 = v18;
      -[SMSessionDestination location](v5, "location");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "longitude");
      v22 = v21;
      if (v19 != v21)
      {
        -[SMSessionDestination location](self, "location");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "longitude");
        v25 = v24;
        -[SMSessionDestination location](v5, "location");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "longitude");
        if (vabdd_f64(v25, v27) >= 2.22044605e-16)
        {
          v16 = 0;
LABEL_27:

LABEL_28:
          v14 = v46;
          if (v8 == v11)
          {
LABEL_30:

            goto LABEL_31;
          }
LABEL_29:

          goto LABEL_30;
        }
        v44 = v26;
        v45 = v23;
      }
      -[SMSessionDestination eta](self, "eta");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMSessionDestination eta](v5, "eta");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28 == v29)
      {
        v43 = v17;
      }
      else
      {
        -[SMSessionDestination eta](self, "eta");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMSessionDestination eta](v5, "eta");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v30;
        if (!objc_msgSend(v30, "isEqual:", v41))
        {
          v16 = 0;
          goto LABEL_25;
        }
        v43 = v17;
      }
      -[SMSessionDestination radius](self, "radius");
      v32 = v31;
      -[SMSessionDestination radius](v5, "radius");
      if (v32 == v33
        && (v34 = -[SMSessionDestination destinationType](self, "destinationType"),
            v34 == -[SMSessionDestination destinationType](v5, "destinationType")))
      {
        -[SMSessionDestination destinationMapItem](self, "destinationMapItem");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMSessionDestination destinationMapItem](v5, "destinationMapItem");
        v36 = objc_claimAutoreleasedReturnValue();
        if (v35 == (void *)v36)
        {

          v16 = 1;
        }
        else
        {
          v40 = (void *)v36;
          -[SMSessionDestination destinationMapItem](self, "destinationMapItem");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[SMSessionDestination destinationMapItem](v5, "destinationMapItem");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v39, "isEqual:", v37);

        }
      }
      else
      {
        v16 = 0;
      }
      v17 = v43;
      if (v28 == v29)
      {
LABEL_26:

        v26 = v44;
        v23 = v45;
        if (v19 == v22)
          goto LABEL_28;
        goto LABEL_27;
      }
LABEL_25:

      goto LABEL_26;
    }
    v16 = 0;
  }
LABEL_31:

  return v16;
}

- (SMSessionDestination)initWithDictionary:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  SMSessionDestinationEta *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  SMSessionDestination *v14;

  v4 = (objc_class *)MEMORY[0x24BE27EB0];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithDictionary:", v5);
  v7 = -[SMSessionDestinationEta initWithDictionary:]([SMSessionDestinationEta alloc], "initWithDictionary:", v5);
  objc_msgSend(v5, "valueForKey:", CFSTR("__kSMSessionDestinationRadiusKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  objc_msgSend(v5, "valueForKey:", CFSTR("__kSMSessionDestinationDestinationTypeKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");

  objc_msgSend(v5, "valueForKey:", CFSTR("__kSMSessionDestinationDestinationMapItem"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[SMSessionDestination initWithLocation:eta:radius:destinationType:destinationMapItem:](self, "initWithLocation:eta:radius:destinationType:destinationMapItem:", v6, v7, v12, v13, v10);
  return v14;
}

- (id)outputToDictionary
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

  v3 = (void *)objc_opt_new();
  -[SMSessionDestination location](self, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputToDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v5);

  v6 = (void *)MEMORY[0x24BDD16E0];
  -[SMSessionDestination radius](self, "radius");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("__kSMSessionDestinationRadiusKey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMSessionDestination destinationType](self, "destinationType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("__kSMSessionDestinationDestinationTypeKey"));

  -[SMSessionDestination destinationMapItem](self, "destinationMapItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("__kSMSessionDestinationDestinationMapItem"));

  -[SMSessionDestination eta](self, "eta");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SMSessionDestination eta](self, "eta");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "outputToDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addEntriesFromDictionary:", v12);

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SMSessionDestination location](self, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latitude");
  v6 = v5;
  -[SMSessionDestination location](self, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "longitude");
  v9 = v8;
  -[SMSessionDestination location](self, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "horizontalUncertainty");
  v12 = v11;
  -[SMSessionDestination location](self, "location");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "referenceFrame");
  -[SMSessionDestination radius](self, "radius");
  v16 = v15;
  -[SMSessionDestination eta](self, "eta");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "destinationTypeToString:", -[SMSessionDestination destinationType](self, "destinationType"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionDestination destinationMapItem](self, "destinationMapItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("location, <%.8f, %.8f> +/- %.2f, referenceFrame %d, radius, %.3f, eta, %@, destinationType, %@, destinationMapItem, %lu"), v6, v9, v12, v14, v16, v17, v18, objc_msgSend(v19, "length"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)destinationTypeToString:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return CFSTR("unknown");
  else
    return off_25166DDA0[a3 - 1];
}

+ (unint64_t)convertPlaceTypeToDestinationType:(unint64_t)a3
{
  if (a3 > 4)
    return 0;
  else
    return qword_245595460[a3];
}

- (RTLocation)location
{
  return self->_location;
}

- (SMSessionDestinationEta)eta
{
  return self->_eta;
}

- (double)radius
{
  return self->_radius;
}

- (unint64_t)destinationType
{
  return self->_destinationType;
}

- (NSData)destinationMapItem
{
  return self->_destinationMapItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationMapItem, 0);
  objc_storeStrong((id *)&self->_eta, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
