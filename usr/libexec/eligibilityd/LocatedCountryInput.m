@implementation LocatedCountryInput

- (LocatedCountryInput)initWithCountryCodes:(id)a3 status:(unint64_t)a4 process:(id)a5
{
  id v8;
  id v9;
  xpc_type_t type;
  const _xpc_type_s *v11;
  id v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  LocatedCountryInput *v21;
  LocatedCountryInput *v22;
  LocatedCountryInput *v23;
  xpc_object_t array;
  uint64_t v25;
  unint64_t v26;
  id v27;
  NSObject *v28;
  id v29;
  id v30;
  NSObject *v31;
  objc_super v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  const char *name;

  v8 = a3;
  v9 = a5;
  if (v8)
  {
    type = xpc_get_type(v8);
    if (type == (xpc_type_t)&_xpc_type_array)
    {
      v13 = v8;
      v17 = 4;
    }
    else
    {
      v11 = type;
      if (type != (xpc_type_t)&_xpc_type_dictionary)
      {
        v12 = sub_10000C5FC();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
LABEL_25:
          v23 = 0;
          goto LABEL_26;
        }
        *(_DWORD *)buf = 136315394;
        v35 = "-[LocatedCountryInput initWithCountryCodes:status:process:]";
        v36 = 2080;
        name = xpc_type_get_name(v11);
        v14 = "%s: Located country codes input is wrong data type: %s";
        v15 = v13;
        v16 = 22;
LABEL_6:
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
        goto LABEL_25;
      }
      array = xpc_dictionary_get_array(v8, "OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION_KEY_COUNTRY_CODE_LIST");
      v25 = objc_claimAutoreleasedReturnValue(array);
      if (!v25)
      {
        v29 = sub_10000C5FC();
        v13 = objc_claimAutoreleasedReturnValue(v29);
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          goto LABEL_25;
        *(_DWORD *)buf = 136315138;
        v35 = "-[LocatedCountryInput initWithCountryCodes:status:process:]";
        v14 = "%s: Located country codes input missing country code array";
        v15 = v13;
        v16 = 12;
        goto LABEL_6;
      }
      v13 = v25;
      v26 = +[LocatedCountryInput _parseConfidenceFromInputDict:](LocatedCountryInput, "_parseConfidenceFromInputDict:", v8);
      if (!v26)
      {
        v30 = sub_10000C5FC();
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v35 = "-[LocatedCountryInput initWithCountryCodes:status:process:]";
          _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s: Located country codes input missing confidence values", buf, 0xCu);
        }

        goto LABEL_25;
      }
      v17 = v26;
    }
    v18 = (void *)_CFXPCCreateCFObjectFromXPCObject(v13);
    v19 = objc_opt_class(NSString);
    if ((sub_100016424(v18, v19) & 1) == 0)
    {
      v27 = sub_10000C5FC();
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v35 = "-[LocatedCountryInput initWithCountryCodes:status:process:]";
        _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s: Located country codes input contains non-String entries", buf, 0xCu);
      }

      goto LABEL_25;
    }
    v20 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v18));

    v13 = v20;
  }
  else
  {
    v17 = 0;
    v13 = 0;
  }
  v33.receiver = self;
  v33.super_class = (Class)LocatedCountryInput;
  v21 = -[EligibilityInput initWithInputType:status:process:](&v33, "initWithInputType:status:process:", 1, a4, v9);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_countryCodes, v13);
    v22->_confidence = v17;
  }
  self = v22;
  v23 = self;
LABEL_26:

  return v23;
}

- (unint64_t)_deviceMinimiumRequiredConfidence
{
  if (MGGetBoolAnswer(CFSTR("cellular-data"), a2))
    return 2;
  else
    return 1;
}

- (NSSet)countryCodes
{
  unint64_t v3;
  NSSet *v4;

  v3 = -[LocatedCountryInput confidence](self, "confidence");
  if (v3 >= -[LocatedCountryInput _deviceMinimiumRequiredConfidence](self, "_deviceMinimiumRequiredConfidence"))
    v4 = self->_countryCodes;
  else
    v4 = 0;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LocatedCountryInput;
  v4 = a3;
  -[EligibilityInput encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LocatedCountryInput countryCodes](self, "countryCodes", v6.receiver, v6.super_class));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("countryCodes"));

}

- (LocatedCountryInput)initWithCoder:(id)a3
{
  id v4;
  LocatedCountryInput *v5;
  uint64_t v6;
  NSSet *v7;
  void *v8;
  uint64_t v9;
  NSSet *countryCodes;
  id v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)LocatedCountryInput;
  v5 = -[EligibilityInput initWithCoder:](&v14, "initWithCoder:", v4);
  if (v5)
  {
    v6 = objc_opt_class(NSSet);
    v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(NSString), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("countryCodes")));
    countryCodes = v5->_countryCodes;
    v5->_countryCodes = (NSSet *)v9;

    v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("confidence"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v5->_confidence = (unint64_t)objc_msgSend(v12, "unsignedIntegerValue");

    if (!v5->_confidence)
    {
      if (v5->_countryCodes)
        v5->_confidence = 4;
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LocatedCountryInput;
  v5 = -[EligibilityInput copyWithZone:](&v9, "copyWithZone:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LocatedCountryInput countryCodes](self, "countryCodes"));
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setCountryCodes:", v7);

  objc_msgSend(v5, "setConfidence:", -[LocatedCountryInput confidence](self, "confidence"));
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LocatedCountryInput;
  v3 = -[EligibilityInput hash](&v8, "hash");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LocatedCountryInput countryCodes](self, "countryCodes"));
  v5 = (unint64_t)objc_msgSend(v4, "hash");
  v6 = v5 ^ -[LocatedCountryInput confidence](self, "confidence") ^ v3;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  LocatedCountryInput *v4;
  uint64_t v5;
  LocatedCountryInput *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  BOOL v14;
  id v15;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  const char *v21;

  v4 = (LocatedCountryInput *)a3;
  v17.receiver = self;
  v17.super_class = (Class)LocatedCountryInput;
  if (-[EligibilityInput isEqual:](&v17, "isEqual:", v4))
  {
    if (v4 == self)
    {
      v14 = 1;
      goto LABEL_14;
    }
    v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[LocatedCountryInput countryCodes](self, "countryCodes"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[LocatedCountryInput countryCodes](v6, "countryCodes"));
      v9 = sub_1000163A4(v7, v8);

      if ((v9 & 1) != 0)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[LocatedCountryInput countryCodes](self, "countryCodes"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[LocatedCountryInput countryCodes](v6, "countryCodes"));

        if (v10 == v11)
        {
          v14 = 1;
          goto LABEL_13;
        }
        v12 = sub_10000C5FC();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          goto LABEL_11;
      }
      else
      {
        v15 = sub_10000C5FC();
        v13 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
LABEL_11:
          *(_DWORD *)buf = 136315394;
          v19 = "-[LocatedCountryInput isEqual:]";
          v20 = 2080;
          v21 = "countryCodes";
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: Property %s did not match", buf, 0x16u);
        }
      }

      v14 = 0;
LABEL_13:

      goto LABEL_14;
    }
  }
  v14 = 0;
LABEL_14:

  return v14;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LocatedCountryInput countryCodes](self, "countryCodes"));
  v4 = -[LocatedCountryInput confidence](self, "confidence");
  v9.receiver = self;
  v9.super_class = (Class)LocatedCountryInput;
  v5 = -[EligibilityInput description](&v9, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[LocatedCountryInput countryCodes:%@ confidence:%lu %@]"), v3, v4, v6));

  return v7;
}

- (void)setCountryCodes:(id)a3
{
  objc_storeStrong((id *)&self->_countryCodes, a3);
}

- (unint64_t)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(unint64_t)a3
{
  self->_confidence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCodes, 0);
}

+ (unint64_t)_parseConfidenceFromInputDict:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if (xpc_dictionary_get_BOOL(v3, "OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION_KEY_HAS_SINGLE_LOCATION"))
  {
    v4 = 4;
  }
  else if (xpc_dictionary_get_BOOL(v3, "OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION_KEY_HAS_NEARBY_CELLS_MCC"))
  {
    v4 = 3;
  }
  else if (xpc_dictionary_get_BOOL(v3, "OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION_KEY_HAS_SERVING_CELL_MCC"))
  {
    v4 = 2;
  }
  else
  {
    v4 = xpc_dictionary_get_BOOL(v3, "OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION_KEY_HAS_WIFIAP");
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
