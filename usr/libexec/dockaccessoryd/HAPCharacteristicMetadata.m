@implementation HAPCharacteristicMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HAPCharacteristicMetadata)initWithConstraints:(id)a3 description:(id)a4 format:(id)a5 units:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  HAPCharacteristicMetadata *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  unsigned int v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  __CFString *v28;
  void *v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  __CFString *v33;
  void *v34;
  HAPCharacteristicMetadata *v35;
  HAPCharacteristicMetadata *v36;
  HAPCharacteristicMetadata *v37;
  uint64_t v38;
  HAPMetadataConstraints *constraints;
  id v41;
  objc_super v42;
  uint8_t buf[4];
  void *v44;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (!v10 && !v11 && !v12 && !v13)
  {
LABEL_12:
    v35 = 0;
    goto LABEL_16;
  }
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "maxLength"));
  if (v15)
  {
    v16 = (void *)v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "maxLength"));
    v41 = a5;
    v18 = v10;
    v19 = self;
    v20 = v12;
    v21 = v14;
    v22 = v11;
    v23 = v17;
    v24 = objc_msgSend(v17, "unsignedIntValue");

    v11 = v22;
    v14 = v21;
    v12 = v20;
    self = v19;
    v10 = v18;
    a5 = v41;

    if (v24 >= 0x101)
    {
      v26 = sub_10007CCE4(0, v25);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = sub_10007CD2C(0);
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        *(_DWORD *)buf = 138543362;
        v44 = v29;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%{public}@### Value of maxLength exceeds maximum allowed value", buf, 0xCu);

      }
      v31 = sub_10007CCE4(0, v30);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = sub_10007CD2C(0);
        v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
        *(_DWORD *)buf = 138543362;
        v44 = v34;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%{public}@### Unable to initialize metadata because of invalid arguments", buf, 0xCu);

      }
      goto LABEL_12;
    }
  }
  v42.receiver = self;
  v42.super_class = (Class)HAPCharacteristicMetadata;
  v36 = -[HAPCharacteristicMetadata init](&v42, "init");
  v37 = v36;
  if (v36)
  {
    objc_storeStrong((id *)&v36->_manufacturerDescription, a4);
    objc_storeStrong((id *)&v37->_format, a5);
    objc_storeStrong((id *)&v37->_units, a6);
    v38 = objc_claimAutoreleasedReturnValue(-[HAPCharacteristicMetadata _generateValidConstraints:](v37, "_generateValidConstraints:", v10));
    constraints = v37->_constraints;
    v37->_constraints = (HAPMetadataConstraints *)v38;

  }
  self = v37;
  v35 = self;
LABEL_16:

  return v35;
}

- (id)description
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = objc_alloc_init((Class)NSMutableString);
  v11.receiver = self;
  v11.super_class = (Class)HAPCharacteristicMetadata;
  v4 = -[HAPCharacteristicMetadata description](&v11, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@  "), v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicMetadata constraints](self, "constraints"));
  objc_msgSend(v3, "appendFormat:", CFSTR("Constraints: %@  "), v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicMetadata manufacturerDescription](self, "manufacturerDescription"));
  objc_msgSend(v3, "appendFormat:", CFSTR("Description: %@  "), v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicMetadata format](self, "format"));
  objc_msgSend(v3, "appendFormat:", CFSTR("Format: %@  "), v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicMetadata units](self, "units"));
  objc_msgSend(v3, "appendFormat:", CFSTR("Units: %@  "), v9);

  return v3;
}

- (id)_generateValidConstraints:(id)a3
{
  HAPMetadataConstraints *v4;
  void *v5;
  unsigned int v6;
  HAPMetadataConstraints *v7;
  void *v8;
  void *v9;
  void *v10;
  HAPMetadataConstraints *v11;
  void *v13;
  id v14;

  v4 = (HAPMetadataConstraints *)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicMetadata format](self, "format"));
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("string"));

  v7 = v4;
  if (v6)
  {
    v7 = v4;
    if (!v4)
      v7 = objc_alloc_init(HAPMetadataConstraints);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints maxLength](v7, "maxLength"));

    if (!v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 64));
      -[HAPMetadataConstraints setMaxLength:](v7, "setMaxLength:", v9);

    }
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints minimumValue](v7, "minimumValue"));
  if (v10
    || (v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints maximumValue](v7, "maximumValue"))) != 0
    || (v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints stepValue](v7, "stepValue"))) != 0
    || (v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints minLength](v7, "minLength"))) != 0
    || (v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints maxLength](v7, "maxLength"))) != 0)
  {

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints validValues](v7, "validValues"));
    v14 = objc_msgSend(v13, "count");

    if (!v14)
    {
      v11 = 0;
      goto LABEL_13;
    }
  }
  v11 = v7;
LABEL_13:

  return v11;
}

- (BOOL)isEqualToCharacteristicMetadata:(id)a3
{
  uint64_t v4;
  HAPCharacteristicMetadata *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  unsigned __int8 v16;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;

  v5 = (HAPCharacteristicMetadata *)a3;
  if (self == v5)
  {
    v16 = 1;
  }
  else
  {
    v6 = objc_opt_class(HAPCharacteristicMetadata, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
      goto LABEL_6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicMetadata manufacturerDescription](self, "manufacturerDescription"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicMetadata manufacturerDescription](v5, "manufacturerDescription"));
    v9 = sub_10007BF28((unint64_t)v7, (uint64_t)v8);

    if ((v9 & 1) != 0)
      goto LABEL_6;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicMetadata format](self, "format"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicMetadata format](v5, "format"));
    v12 = sub_10007BF28((unint64_t)v10, (uint64_t)v11);

    if ((v12 & 1) != 0
      || (v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicMetadata units](self, "units")),
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicMetadata units](v5, "units")),
          v15 = sub_10007BF28((unint64_t)v13, (uint64_t)v14),
          v14,
          v13,
          (v15 & 1) != 0))
    {
LABEL_6:
      v16 = 0;
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicMetadata constraints](self, "constraints"));
      v19 = objc_claimAutoreleasedReturnValue(-[HAPCharacteristicMetadata constraints](v5, "constraints"));
      if (v18 == (void *)v19)
      {
        v16 = 1;
        v20 = v18;
      }
      else
      {
        v20 = (void *)v19;
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicMetadata constraints](self, "constraints"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicMetadata constraints](v5, "constraints"));
        v16 = objc_msgSend(v21, "isEqualToMetadataConstraints:", v22);

      }
    }
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicMetadata constraints](self, "constraints"));
    v7 = objc_msgSend(v6, "copyWithZone:", a3);
    v8 = (void *)v5[1];
    v5[1] = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicMetadata manufacturerDescription](self, "manufacturerDescription"));
    v10 = objc_msgSend(v9, "copyWithZone:", a3);
    v11 = (void *)v5[2];
    v5[2] = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicMetadata format](self, "format"));
    v13 = objc_msgSend(v12, "copyWithZone:", a3);
    v14 = (void *)v5[3];
    v5[3] = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicMetadata units](self, "units"));
    v16 = objc_msgSend(v15, "copyWithZone:", a3);
    v17 = (void *)v5[4];
    v5[4] = v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicMetadata constraints](self, "constraints"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("MC"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicMetadata manufacturerDescription](self, "manufacturerDescription"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("MD"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicMetadata format](self, "format"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("MF"));

  v8 = (id)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicMetadata units](self, "units"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("MU"));

}

- (HAPCharacteristicMetadata)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  HAPCharacteristicMetadata *v6;
  id v7;
  uint64_t v8;
  HAPMetadataConstraints *constraints;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSString *manufacturerDescription;
  uint64_t v14;
  id v15;
  uint64_t v16;
  NSString *format;
  uint64_t v18;
  id v19;
  uint64_t v20;
  NSString *units;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HAPCharacteristicMetadata;
  v6 = -[HAPCharacteristicMetadata init](&v23, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(HAPMetadataConstraints, v5), CFSTR("MC"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    constraints = v6->_constraints;
    v6->_constraints = (HAPMetadataConstraints *)v8;

    v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v10), CFSTR("MD"));
    v12 = objc_claimAutoreleasedReturnValue(v11);
    manufacturerDescription = v6->_manufacturerDescription;
    v6->_manufacturerDescription = (NSString *)v12;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v14), CFSTR("MF"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    format = v6->_format;
    v6->_format = (NSString *)v16;

    v19 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v18), CFSTR("MU"));
    v20 = objc_claimAutoreleasedReturnValue(v19);
    units = v6->_units;
    v6->_units = (NSString *)v20;

  }
  return v6;
}

- (HAPMetadataConstraints)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (NSString)manufacturerDescription
{
  return self->_manufacturerDescription;
}

- (void)setManufacturerDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)format
{
  return self->_format;
}

- (void)setFormat:(id)a3
{
  objc_storeStrong((id *)&self->_format, a3);
}

- (NSString)units
{
  return self->_units;
}

- (void)setUnits:(id)a3
{
  objc_storeStrong((id *)&self->_units, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_units, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_manufacturerDescription, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
}

@end
