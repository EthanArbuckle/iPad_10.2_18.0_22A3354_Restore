@implementation NIBluetoothSample

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_partIdentifier, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NIBluetoothSample)initWithRSSI:(double)a3 identifier:(id)a4 model:(id)a5 channel:(int)a6 machContinuousTimeSeconds:(double)a7
{
  return -[NIBluetoothSample initWithRSSI:identifier:model:channel:machContinuousTimeSeconds:partIdentifier:name:](self, "initWithRSSI:identifier:model:channel:machContinuousTimeSeconds:partIdentifier:name:", a4, a5, *(_QWORD *)&a6, &stru_10081D5E0, 0, a3, a7);
}

- (NIBluetoothSample)initWithRSSI:(double)a3 identifier:(id)a4 model:(id)a5 channel:(int)a6 machContinuousTimeSeconds:(double)a7 partIdentifier:(id)a8 name:(id)a9
{
  id v17;
  id v18;
  id v19;
  id v20;
  NIBluetoothSample *v21;
  NIBluetoothSample *v22;
  const __CFString *v23;
  NSString *model;
  objc_super v26;

  v17 = a4;
  v18 = a5;
  v19 = a8;
  v20 = a9;
  v26.receiver = self;
  v26.super_class = (Class)NIBluetoothSample;
  v21 = -[NIBluetoothSample init](&v26, "init");
  v22 = v21;
  if (v21)
  {
    v21->_rssi = a3;
    objc_storeStrong((id *)&v21->_identifier, a4);
    if (v18)
      v23 = (const __CFString *)v18;
    else
      v23 = CFSTR("NONE");
    model = v22->_model;
    v22->_model = &v23->isa;

    v22->_channel = a6;
    v22->_machContinuousTimeSeconds = a7;
    objc_storeStrong((id *)&v22->_partIdentifier, a8);
    objc_storeStrong((id *)&v22->_name, a9);
  }

  return v22;
}

- (NIBluetoothSample)initWithBluetoothSample:(id)a3
{
  id v5;
  NIBluetoothSample *v6;
  double v7;
  uint64_t v8;
  NSString *identifier;
  uint64_t v10;
  NSString *model;
  double v12;
  uint64_t v13;
  NSString *partIdentifier;
  uint64_t v15;
  NSString *name;
  void *v18;
  objc_super v19;

  v5 = a3;
  if (!v5)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIBluetoothSample.mm"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sample"));

  }
  v19.receiver = self;
  v19.super_class = (Class)NIBluetoothSample;
  v6 = -[NIBluetoothSample init](&v19, "init");
  if (v6)
  {
    objc_msgSend(v5, "rssi");
    v6->_rssi = v7;
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v8;

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "model"));
    model = v6->_model;
    v6->_model = (NSString *)v10;

    v6->_channel = objc_msgSend(v5, "channel");
    objc_msgSend(v5, "machContinuousTimeSeconds");
    v6->_machContinuousTimeSeconds = v12;
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "partIdentifier"));
    partIdentifier = v6->_partIdentifier;
    v6->_partIdentifier = (NSString *)v13;

    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
    name = v6->_name;
    v6->_name = (NSString *)v15;

  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3);
  return _objc_msgSend(v4, "initWithBluetoothSample:", self);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("rssi"), self->_rssi);
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_model, CFSTR("model"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_channel, CFSTR("channel"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("machContinuousTimeSeconds"), self->_machContinuousTimeSeconds);
  objc_msgSend(v4, "encodeObject:forKey:", self->_partIdentifier, CFSTR("partIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, CFSTR("name"));

}

- (NIBluetoothSample)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  unsigned int v17;
  double v18;
  double v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NIBluetoothSample *v29;
  NIBluetoothSample *v30;
  NIBluetoothSample *v31;
  objc_super v33;

  v4 = a3;
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v8), CFSTR("model"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (v7
    && (v12 = objc_opt_class(NSString, v10),
        (objc_opt_isKindOfClass(v7, v12) & (v11 != 0)) == 1)
    && (v14 = objc_opt_class(NSString, v13), (objc_opt_isKindOfClass(v11, v14) & 1) != 0))
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("rssi"));
    v16 = v15;
    v17 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("channel"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("machContinuousTimeSeconds"));
    v19 = v18;
    v21 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v20), CFSTR("partIdentifier"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(v21);
    if (v23)
    {
      v24 = objc_opt_class(NSString, v22);
      if ((objc_opt_isKindOfClass(v23, v24) & 1) == 0)
      {

        v23 = 0;
      }
    }
    v25 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v22), CFSTR("name"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(v25);
    if (v27)
    {
      v28 = objc_opt_class(NSString, v26);
      if ((objc_opt_isKindOfClass(v27, v28) & 1) == 0)
      {

        v27 = 0;
      }
    }
    v33.receiver = self;
    v33.super_class = (Class)NIBluetoothSample;
    v29 = -[NIBluetoothSample init](&v33, "init");
    v30 = v29;
    if (v29)
    {
      v29->_rssi = v16;
      objc_storeStrong((id *)&v29->_identifier, v7);
      objc_storeStrong((id *)&v30->_model, v11);
      v30->_channel = v17;
      v30->_machContinuousTimeSeconds = v19;
      objc_storeStrong((id *)&v30->_partIdentifier, v23);
      objc_storeStrong((id *)&v30->_name, v27);
    }
    self = v30;

    v31 = self;
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NIBluetoothSample *v7;
  NIBluetoothSample *v8;
  NSString *identifier;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  NSString *model;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  double rssi;
  double v18;
  double v19;
  int channel;
  unsigned int v21;
  double machContinuousTimeSeconds;
  double v23;
  double v24;
  NSString *partIdentifier;
  void *v26;
  void *v27;
  unsigned __int8 v28;
  NSString *name;
  void *v30;
  void *v31;
  unsigned __int8 v32;
  char v33;
  char v34;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (NIBluetoothSample *)v4;
    v8 = v7;
    if (v7 == self)
    {
      v34 = 1;
LABEL_28:

      goto LABEL_29;
    }
    identifier = self->_identifier;
    if (!identifier)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NIBluetoothSample identifier](v7, "identifier"));

      if (!v10)
      {
        v12 = 1;
LABEL_7:
        model = self->_model;
        if (!model)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NIBluetoothSample model](v8, "model"));

          if (!v14)
          {
            v16 = 1;
LABEL_11:
            rssi = self->_rssi;
            -[NIBluetoothSample rssi](v8, "rssi");
            v19 = v18;
            channel = self->_channel;
            v21 = -[NIBluetoothSample channel](v8, "channel");
            machContinuousTimeSeconds = self->_machContinuousTimeSeconds;
            -[NIBluetoothSample machContinuousTimeSeconds](v8, "machContinuousTimeSeconds");
            v24 = v23;
            partIdentifier = self->_partIdentifier;
            if (!partIdentifier)
            {
              v26 = (void *)objc_claimAutoreleasedReturnValue(-[NIBluetoothSample partIdentifier](v8, "partIdentifier"));

              if (!v26)
              {
                v28 = 1;
LABEL_15:
                name = self->_name;
                if (!name)
                {
                  v30 = (void *)objc_claimAutoreleasedReturnValue(-[NIBluetoothSample name](v8, "name"));

                  if (!v30)
                  {
LABEL_19:
                    v33 = v12 & v16;
                    if (rssi != v19)
                      v33 = 0;
                    if (channel != v21)
                      v33 = 0;
                    if (machContinuousTimeSeconds != v24)
                      v33 = 0;
                    v34 = v33 & v28;
                    goto LABEL_28;
                  }
                  name = self->_name;
                }
                v31 = (void *)objc_claimAutoreleasedReturnValue(-[NIBluetoothSample name](v8, "name"));
                v32 = -[NSString isEqualToString:](name, "isEqualToString:", v31);

                v28 &= v32;
                goto LABEL_19;
              }
              partIdentifier = self->_partIdentifier;
            }
            v27 = (void *)objc_claimAutoreleasedReturnValue(-[NIBluetoothSample partIdentifier](v8, "partIdentifier"));
            v28 = -[NSString isEqualToString:](partIdentifier, "isEqualToString:", v27);

            goto LABEL_15;
          }
          model = self->_model;
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NIBluetoothSample model](v8, "model"));
        v16 = -[NSString isEqualToString:](model, "isEqualToString:", v15);

        goto LABEL_11;
      }
      identifier = self->_identifier;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NIBluetoothSample identifier](v8, "identifier"));
    v12 = -[NSString isEqualToString:](identifier, "isEqualToString:", v11);

    goto LABEL_7;
  }
  v34 = 0;
LABEL_29:

  return v34;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  NSUInteger v11;
  unint64_t v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_rssi));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_identifier, "hash");
  v6 = -[NSString hash](self->_model, "hash");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_channel));
  v8 = (unint64_t)objc_msgSend(v7, "hash");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_machContinuousTimeSeconds));
  v10 = (unint64_t)objc_msgSend(v9, "hash");
  v11 = -[NSString hash](self->_name, "hash");
  v12 = v5 ^ v4 ^ v6 ^ v8 ^ v10 ^ v11 ^ -[NSString hash](self->_partIdentifier, "hash");

  return v12;
}

- (id)description
{
  id v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  id v8;
  void *v9;

  v3 = objc_alloc((Class)NSMutableString);
  v5 = (objc_class *)objc_opt_class(self, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v7);

  objc_msgSend(v8, "appendFormat:", CFSTR("Identifier: %@"), self->_identifier);
  objc_msgSend(v8, "appendFormat:", CFSTR(", RSSI: %.2f"), *(_QWORD *)&self->_rssi);
  objc_msgSend(v8, "appendFormat:", CFSTR(", Mach Continuous Time Seconds: %f"), *(_QWORD *)&self->_machContinuousTimeSeconds);
  objc_msgSend(v8, "appendFormat:", CFSTR(", Channel: %d"), self->_channel);
  objc_msgSend(v8, "appendFormat:", CFSTR(", Model: %@"), self->_model);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NIBluetoothSample descriptionInternal](self, "descriptionInternal"));
  objc_msgSend(v8, "appendString:", v9);

  objc_msgSend(v8, "appendString:", CFSTR(">"));
  return v8;
}

- (id)descriptionInternal
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(", partIdentifier: %@"), self->_partIdentifier);
}

- (double)rssi
{
  return self->_rssi;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)model
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (int)channel
{
  return self->_channel;
}

- (double)machContinuousTimeSeconds
{
  return self->_machContinuousTimeSeconds;
}

- (NSString)partIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

@end
