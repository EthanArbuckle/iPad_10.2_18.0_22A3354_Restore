@implementation HAPMetadataConstraints

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  id v25;
  const __CFString *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *i;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v3 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithString:", CFSTR("[ Constraints:"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints minimumValue](self, "minimumValue"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints minimumValue](self, "minimumValue"));
    objc_msgSend(v5, "doubleValue");
    objc_msgSend(v3, "appendFormat:", CFSTR("%@%@%.2f"), CFSTR(" "), CFSTR("Min: "), v6);

    v7 = 1;
  }
  else
  {
    v7 = 0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints maximumValue](self, "maximumValue"));

  if (v8)
  {
    ++v7;
    if (v4)
      v9 = CFSTR(", ");
    else
      v9 = CFSTR(" ");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints maximumValue](self, "maximumValue"));
    objc_msgSend(v10, "doubleValue");
    objc_msgSend(v3, "appendFormat:", CFSTR("%@%@%.2f"), v9, CFSTR("Max: "), v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints stepValue](self, "stepValue"));

  if (v12)
  {
    v13 = v7 + 1;
    if (v7)
      v14 = CFSTR(", ");
    else
      v14 = CFSTR(" ");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints stepValue](self, "stepValue"));
    objc_msgSend(v15, "doubleValue");
    objc_msgSend(v3, "appendFormat:", CFSTR("%@%@%.2f"), v14, CFSTR("Step: "), v16);

    v7 = v13;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints minLength](self, "minLength"));

  if (v17)
  {
    v18 = v7 + 1;
    if (v7)
      v19 = CFSTR(", ");
    else
      v19 = CFSTR(" ");
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints minLength](self, "minLength"));
    objc_msgSend(v3, "appendFormat:", CFSTR("%@%@%u"), v19, CFSTR("Min length: "), objc_msgSend(v20, "unsignedIntValue"));

    v7 = v18;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints maxLength](self, "maxLength"));

  if (v21)
  {
    if (v7)
      v22 = CFSTR(", ");
    else
      v22 = CFSTR(" ");
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints maxLength](self, "maxLength"));
    objc_msgSend(v3, "appendFormat:", CFSTR("%@%@%u"), v22, CFSTR("Max length: "), objc_msgSend(v23, "unsignedIntValue"));

    v7 = 1;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints validValues](self, "validValues"));
  v25 = objc_msgSend(v24, "count");

  if (v25)
  {
    if (v7)
      v26 = CFSTR(", ");
    else
      v26 = CFSTR(" ");
    objc_msgSend(v3, "appendFormat:", CFSTR("%@%@"), v26, CFSTR("Valid Values: "));
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints validValues](self, "validValues"));
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v29; i = (char *)i + 1)
        {
          if (*(_QWORD *)v34 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(v3, "appendFormat:", CFSTR("%@, "), *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i));
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v29);
    }

  }
  objc_msgSend(v3, "appendString:", CFSTR(" ]"));
  return v3;
}

- (BOOL)isEqualToMetadataConstraints:(id)a3
{
  uint64_t v4;
  HAPMetadataConstraints *v5;
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
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  char v21;
  char v22;
  void *v24;
  void *v25;
  char v26;

  v5 = (HAPMetadataConstraints *)a3;
  if (self == v5)
  {
    v22 = 1;
  }
  else
  {
    v6 = objc_opt_class(HAPMetadataConstraints, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
      goto LABEL_8;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints minimumValue](self, "minimumValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints minimumValue](v5, "minimumValue"));
    v9 = sub_10007BF54(v7, v8);

    if ((v9 & 1) != 0)
      goto LABEL_8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints maximumValue](self, "maximumValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints maximumValue](v5, "maximumValue"));
    v12 = sub_10007BF54(v10, v11);

    if ((v12 & 1) != 0)
      goto LABEL_8;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints stepValue](self, "stepValue"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints stepValue](v5, "stepValue"));
    v15 = sub_10007BF54(v13, v14);

    if ((v15 & 1) != 0)
      goto LABEL_8;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints minLength](self, "minLength"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints minLength](v5, "minLength"));
    v18 = sub_10007BF54(v16, v17);

    if ((v18 & 1) != 0
      || (v19 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints maxLength](self, "maxLength")),
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints maxLength](v5, "maxLength")),
          v21 = sub_10007BF54(v19, v20),
          v20,
          v19,
          (v21 & 1) != 0))
    {
LABEL_8:
      v22 = 0;
    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints validValues](self, "validValues"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints validValues](v5, "validValues"));
      v26 = sub_10007C008((unint64_t)v24, (uint64_t)v25);

      v22 = v26 ^ 1;
    }
  }

  return v22;
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
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints minimumValue](self, "minimumValue"));
    v7 = objc_msgSend(v6, "copyWithZone:", a3);
    v8 = (void *)v5[1];
    v5[1] = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints maximumValue](self, "maximumValue"));
    v10 = objc_msgSend(v9, "copyWithZone:", a3);
    v11 = (void *)v5[2];
    v5[2] = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints stepValue](self, "stepValue"));
    v13 = objc_msgSend(v12, "copyWithZone:", a3);
    v14 = (void *)v5[3];
    v5[3] = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints minLength](self, "minLength"));
    v16 = objc_msgSend(v15, "copyWithZone:", a3);
    v17 = (void *)v5[4];
    v5[4] = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints maxLength](self, "maxLength"));
    v19 = objc_msgSend(v18, "copyWithZone:", a3);
    v20 = (void *)v5[5];
    v5[5] = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints validValues](self, "validValues"));
    v22 = objc_msgSend(v21, "copyWithZone:", a3);
    v23 = (void *)v5[6];
    v5[6] = v22;

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
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints minimumValue](self, "minimumValue"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CMinV"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints maximumValue](self, "maximumValue"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("CMaxV"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints stepValue](self, "stepValue"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("CSV"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints minLength](self, "minLength"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("CMinL"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints maxLength](self, "maxLength"));
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("CMaxL"));

  v10 = (id)objc_claimAutoreleasedReturnValue(-[HAPMetadataConstraints validValues](self, "validValues"));
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("CVV"));

}

- (HAPMetadataConstraints)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  HAPMetadataConstraints *v6;
  id v7;
  uint64_t v8;
  NSNumber *minimumValue;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSNumber *maximumValue;
  uint64_t v14;
  id v15;
  uint64_t v16;
  NSNumber *stepValue;
  uint64_t v18;
  id v19;
  uint64_t v20;
  NSNumber *minLength;
  uint64_t v22;
  id v23;
  uint64_t v24;
  NSNumber *maxLength;
  uint64_t v26;
  id v27;
  uint64_t v28;
  NSArray *validValues;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)HAPMetadataConstraints;
  v6 = -[HAPMetadataConstraints init](&v31, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v5), CFSTR("CMinV"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    minimumValue = v6->_minimumValue;
    v6->_minimumValue = (NSNumber *)v8;

    v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v10), CFSTR("CMaxV"));
    v12 = objc_claimAutoreleasedReturnValue(v11);
    maximumValue = v6->_maximumValue;
    v6->_maximumValue = (NSNumber *)v12;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v14), CFSTR("CSV"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    stepValue = v6->_stepValue;
    v6->_stepValue = (NSNumber *)v16;

    v19 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v18), CFSTR("CMinL"));
    v20 = objc_claimAutoreleasedReturnValue(v19);
    minLength = v6->_minLength;
    v6->_minLength = (NSNumber *)v20;

    v23 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v22), CFSTR("CMaxL"));
    v24 = objc_claimAutoreleasedReturnValue(v23);
    maxLength = v6->_maxLength;
    v6->_maxLength = (NSNumber *)v24;

    v27 = objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(NSNumber, v26), CFSTR("CVV"));
    v28 = objc_claimAutoreleasedReturnValue(v27);
    validValues = v6->_validValues;
    v6->_validValues = (NSArray *)v28;

  }
  return v6;
}

- (NSNumber)minimumValue
{
  return self->_minimumValue;
}

- (void)setMinimumValue:(id)a3
{
  objc_storeStrong((id *)&self->_minimumValue, a3);
}

- (NSNumber)maximumValue
{
  return self->_maximumValue;
}

- (void)setMaximumValue:(id)a3
{
  objc_storeStrong((id *)&self->_maximumValue, a3);
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

- (void)setValidValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validValues, 0);
  objc_storeStrong((id *)&self->_maxLength, 0);
  objc_storeStrong((id *)&self->_minLength, 0);
  objc_storeStrong((id *)&self->_stepValue, 0);
  objc_storeStrong((id *)&self->_maximumValue, 0);
  objc_storeStrong((id *)&self->_minimumValue, 0);
}

@end
