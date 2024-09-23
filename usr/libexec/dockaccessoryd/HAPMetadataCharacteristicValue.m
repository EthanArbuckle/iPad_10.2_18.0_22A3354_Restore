@implementation HAPMetadataCharacteristicValue

- (HAPMetadataCharacteristicValue)initWithMinLength:(id)a3 maxLength:(id)a4
{
  unint64_t v7;
  unint64_t v8;
  HAPMetadataCharacteristicValue *v9;
  HAPMetadataCharacteristicValue *v10;
  NSNumber *v11;
  objc_super v13;

  v7 = (unint64_t)a3;
  v8 = (unint64_t)a4;
  if (v7 | v8)
  {
    v13.receiver = self;
    v13.super_class = (Class)HAPMetadataCharacteristicValue;
    v9 = -[HAPMetadataCharacteristicValue init](&v13, "init");
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_minLength, a3);
      v11 = (NSNumber *)(id)v8;
      self = (HAPMetadataCharacteristicValue *)v10->_maxLength;
      v10->_maxLength = v11;
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (HAPMetadataCharacteristicValue)initWithMinValue:(id)a3 maxValue:(id)a4 stepValue:(id)a5 validValues:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HAPMetadataCharacteristicValue *v15;
  HAPMetadataCharacteristicValue *v16;
  NSArray *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11 || v12 || v13)
  {
    v19.receiver = self;
    v19.super_class = (Class)HAPMetadataCharacteristicValue;
    v16 = -[HAPMetadataCharacteristicValue init](&v19, "init");
    v15 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_minValue, a3);
      objc_storeStrong((id *)&v15->_maxValue, a4);
      objc_storeStrong((id *)&v15->_stepValue, a5);
      v17 = (NSArray *)v14;
      self = (HAPMetadataCharacteristicValue *)v15->_validValues;
      v15->_validValues = v17;
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)initWithDictionary:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  HAPMetadataCharacteristicValue *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  __CFString *v14;
  void *v15;
  HAPMetadataCharacteristicValue *v16;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;

  v3 = a3;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hmf_numberForKey:", CFSTR("MinLength")));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hmf_numberForKey:", CFSTR("MaxLength")));
  if (v4 | v5)
    v6 = -[HAPMetadataCharacteristicValue initWithMinLength:maxLength:]([HAPMetadataCharacteristicValue alloc], "initWithMinLength:maxLength:", v4, v5);
  else
    v6 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hmf_numberForKey:", CFSTR("MinValue")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hmf_numberForKey:", CFSTR("MaxValue")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hmf_numberForKey:", CFSTR("StepValue")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hmf_arrayForKey:", CFSTR("ValidValues")));
  if (v7 || v8 || v9)
  {
    if (v6)
    {
      v12 = sub_10007CCE4(0, v10);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = sub_10007CD2C(0);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v14);
        *(_DWORD *)buf = 138544898;
        v20 = v18;
        v21 = 2112;
        v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hmf_stringForKey:", CFSTR("ShortUUID")));
        v15 = (void *)v22;
        v23 = 2112;
        v24 = v4;
        v25 = 2112;
        v26 = v5;
        v27 = 2112;
        v28 = v7;
        v29 = 2112;
        v30 = v5;
        v31 = 2112;
        v32 = v9;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@Characteristic %@ has both length and value metadata: minLength %@  maxLength %@  minValue %@  maxValue %@  stepValue %@", buf, 0x48u);

      }
    }
    v16 = -[HAPMetadataCharacteristicValue initWithMinValue:maxValue:stepValue:validValues:]([HAPMetadataCharacteristicValue alloc], "initWithMinValue:maxValue:stepValue:validValues:", v7, v8, v9, v11);

    v6 = v16;
  }

  return v6;
}

- (id)generateDictionary
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
  void *v13;
  void *v14;
  id v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristicValue minLength](self, "minLength"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristicValue minLength](self, "minLength"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("MinLength"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristicValue maxLength](self, "maxLength"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristicValue maxLength](self, "maxLength"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("MaxLength"));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristicValue minValue](self, "minValue"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristicValue minValue](self, "minValue"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("MinValue"));

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristicValue maxValue](self, "maxValue"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristicValue maxValue](self, "maxValue"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("MaxValue"));

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristicValue stepValue](self, "stepValue"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristicValue stepValue](self, "stepValue"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("StepValue"));

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristicValue validValues](self, "validValues"));
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristicValue validValues](self, "validValues"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("ValidValues"));

  }
  return v3;
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("ValueMetadata")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristicValue minLength](self, "minLength"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristicValue minLength](self, "minLength"));
    objc_msgSend(v3, "appendFormat:", CFSTR("  minLength:%@"), v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristicValue maxLength](self, "maxLength"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristicValue maxLength](self, "maxLength"));
    objc_msgSend(v3, "appendFormat:", CFSTR("  maxLength:%@"), v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristicValue minValue](self, "minValue"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristicValue minValue](self, "minValue"));
    objc_msgSend(v3, "appendFormat:", CFSTR("  minValue:%@"), v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristicValue maxValue](self, "maxValue"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristicValue maxValue](self, "maxValue"));
    objc_msgSend(v3, "appendFormat:", CFSTR("  maxValue:%@"), v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristicValue stepValue](self, "stepValue"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristicValue stepValue](self, "stepValue"));
    objc_msgSend(v3, "appendFormat:", CFSTR("  stepValue:%@"), v13);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristicValue validValues](self, "validValues"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristicValue validValues](self, "validValues"));
    objc_msgSend(v3, "appendFormat:", CFSTR("  validValues:%@"), v15);

  }
  return v3;
}

- (void)dump
{
  id v3;
  NSObject *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;

  v3 = sub_10007CCE4(0, (uint64_t)a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = sub_10007CD2C(0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataCharacteristicValue description](self, "description"));
    v8 = 138543618;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@%@", (uint8_t *)&v8, 0x16u);

  }
}

- (NSNumber)minValue
{
  return self->_minValue;
}

- (void)setMinValue:(id)a3
{
  objc_storeStrong((id *)&self->_minValue, a3);
}

- (NSNumber)maxValue
{
  return self->_maxValue;
}

- (void)setMaxValue:(id)a3
{
  objc_storeStrong((id *)&self->_maxValue, a3);
}

- (NSNumber)stepValue
{
  return self->_stepValue;
}

- (void)setStepValue:(id)a3
{
  objc_storeStrong((id *)&self->_stepValue, a3);
}

- (NSNumber)minLength
{
  return self->_minLength;
}

- (void)setMinLength:(id)a3
{
  objc_storeStrong((id *)&self->_minLength, a3);
}

- (NSNumber)maxLength
{
  return self->_maxLength;
}

- (void)setMaxLength:(id)a3
{
  objc_storeStrong((id *)&self->_maxLength, a3);
}

- (NSArray)validValues
{
  return self->_validValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validValues, 0);
  objc_storeStrong((id *)&self->_maxLength, 0);
  objc_storeStrong((id *)&self->_minLength, 0);
  objc_storeStrong((id *)&self->_stepValue, 0);
  objc_storeStrong((id *)&self->_maxValue, 0);
  objc_storeStrong((id *)&self->_minValue, 0);
}

@end
