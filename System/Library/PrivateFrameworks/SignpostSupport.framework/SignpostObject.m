@implementation SignpostObject

- (void)setSignpostId:(unint64_t)a3
{
  self->_signpostId = a3;
}

- (void)setScope:(unint64_t)a3
{
  self->_scope = a3;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  objc_super v63;

  v5 = a3;
  v63.receiver = self;
  v63.super_class = (Class)SignpostObject;
  if (-[SignpostSupportObject isEqual:](&v63, sel_isEqual_, v5))
  {
    v6 = v5;
    v7 = -[SignpostObject signpostId](self, "signpostId");
    if (v7 != objc_msgSend(v6, "signpostId"))
      goto LABEL_18;
    v8 = -[SignpostObject scope](self, "scope");
    if (v8 != objc_msgSend(v6, "scope"))
      goto LABEL_18;
    -[SignpostObject attributes](self, "attributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v6, "attributes");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
        goto LABEL_6;
    }
    -[SignpostObject attributes](self, "attributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {

      if (v9)
      {

      }
    }
    else
    {
      objc_msgSend(v6, "attributes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {

      }
      if (v12)
        goto LABEL_18;
    }
    -[SignpostObject attributes](self, "attributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13
      || (-[SignpostObject attributes](self, "attributes"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "attributes"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v14, "isEqualToDictionary:", v15),
          v15,
          v14,
          v16))
    {
      -[SignpostObject name](self, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if (v19)
      {
        v20 = -[SignpostObject telemetryEnabled](self, "telemetryEnabled");
        if (v20 == objc_msgSend(v6, "telemetryEnabled"))
        {
          -[SignpostObject string1Name](self, "string1Name");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            objc_msgSend(v6, "string1Name");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v18)
              goto LABEL_6;
          }
          -[SignpostObject string1Name](self, "string1Name");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {

            if (v9)
            {

            }
          }
          else
          {
            objc_msgSend(v6, "string1Name");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (v9)
            {

            }
            if (v23)
              goto LABEL_18;
          }
          -[SignpostObject string1Name](self, "string1Name");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            -[SignpostObject string1Name](self, "string1Name");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "string1Name");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "isEqualToString:", v18);

            if (!v26)
              goto LABEL_18;
          }
          -[SignpostObject string1Value](self, "string1Value");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            objc_msgSend(v6, "string1Value");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v18)
              goto LABEL_6;
          }
          -[SignpostObject string1Value](self, "string1Value");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {

            if (v9)
            {

            }
          }
          else
          {
            objc_msgSend(v6, "string1Value");
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (v9)
            {

            }
            if (v28)
              goto LABEL_18;
          }
          -[SignpostObject string1Value](self, "string1Value");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            -[SignpostObject string1Value](self, "string1Value");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "string1Value");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "isEqualToString:", v18);

            if (!v31)
              goto LABEL_18;
          }
          -[SignpostObject string2Name](self, "string2Name");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            objc_msgSend(v6, "string2Name");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v18)
              goto LABEL_6;
          }
          -[SignpostObject string2Name](self, "string2Name");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (v32)
          {

            if (v9)
            {

            }
          }
          else
          {
            objc_msgSend(v6, "string2Name");
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (v9)
            {

            }
            if (v33)
              goto LABEL_18;
          }
          -[SignpostObject string2Name](self, "string2Name");
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (v34)
          {
            -[SignpostObject string2Name](self, "string2Name");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "string2Name");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "isEqualToString:", v18);

            if (!v36)
              goto LABEL_18;
          }
          -[SignpostObject string2Value](self, "string2Value");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            objc_msgSend(v6, "string2Value");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v18)
              goto LABEL_6;
          }
          -[SignpostObject string2Value](self, "string2Value");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (v37)
          {

            if (v9)
            {

            }
          }
          else
          {
            objc_msgSend(v6, "string2Value");
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            if (v9)
            {

            }
            if (v38)
              goto LABEL_18;
          }
          -[SignpostObject string2Value](self, "string2Value");
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if (v39)
          {
            -[SignpostObject string2Value](self, "string2Value");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "string2Value");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "isEqualToString:", v18);

            if (!v41)
              goto LABEL_18;
          }
          -[SignpostObject number1Name](self, "number1Name");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            objc_msgSend(v6, "number1Name");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v18)
              goto LABEL_6;
          }
          -[SignpostObject number1Name](self, "number1Name");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (v42)
          {

            if (v9)
            {

            }
          }
          else
          {
            objc_msgSend(v6, "number1Name");
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            if (v9)
            {

            }
            if (v43)
              goto LABEL_18;
          }
          -[SignpostObject number1Name](self, "number1Name");
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          if (v44)
          {
            -[SignpostObject number1Name](self, "number1Name");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "number1Name");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v45, "isEqualToString:", v18);

            if (!v46)
              goto LABEL_18;
          }
          -[SignpostObject number1Value](self, "number1Value");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            objc_msgSend(v6, "number1Value");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v18)
              goto LABEL_6;
          }
          -[SignpostObject number1Value](self, "number1Value");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          if (v47)
          {

            if (v9)
            {

            }
          }
          else
          {
            objc_msgSend(v6, "number1Value");
            v48 = (void *)objc_claimAutoreleasedReturnValue();

            if (v9)
            {

            }
            if (v48)
              goto LABEL_18;
          }
          -[SignpostObject number1Value](self, "number1Value");
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          if (v49)
          {
            -[SignpostObject number1Value](self, "number1Value");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "number1Value");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = objc_msgSend(v50, "isEqualToNumber:", v18);

            if (!v51)
              goto LABEL_18;
          }
          -[SignpostObject number2Name](self, "number2Name");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            objc_msgSend(v6, "number2Name");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v18)
              goto LABEL_6;
          }
          -[SignpostObject number2Name](self, "number2Name");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          if (v52)
          {

            if (v9)
            {

            }
          }
          else
          {
            objc_msgSend(v6, "number2Name");
            v53 = (void *)objc_claimAutoreleasedReturnValue();

            if (v9)
            {

            }
            if (v53)
              goto LABEL_18;
          }
          -[SignpostObject number2Name](self, "number2Name");
          v54 = (void *)objc_claimAutoreleasedReturnValue();

          if (v54)
          {
            -[SignpostObject number2Name](self, "number2Name");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "number2Name");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = objc_msgSend(v55, "isEqualToString:", v18);

            if (!v56)
              goto LABEL_18;
          }
          -[SignpostObject number2Value](self, "number2Value");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            objc_msgSend(v6, "number2Value");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v18)
            {
LABEL_6:

              goto LABEL_18;
            }
          }
          -[SignpostObject number2Value](self, "number2Value");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          if (v57)
          {

            if (v9)
            {

            }
          }
          else
          {
            objc_msgSend(v6, "number2Value");
            v58 = (void *)objc_claimAutoreleasedReturnValue();

            if (v9)
            {

            }
            if (v58)
              goto LABEL_18;
          }
          -[SignpostObject number2Value](self, "number2Value");
          v59 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v59
            || (-[SignpostObject number2Value](self, "number2Value"),
                v60 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v6, "number2Value"),
                v61 = (void *)objc_claimAutoreleasedReturnValue(),
                v62 = objc_msgSend(v60, "isEqualToNumber:", v61),
                v61,
                v60,
                v62))
          {
            v10 = 1;
            goto LABEL_19;
          }
        }
      }
    }
LABEL_18:
    v10 = 0;
LABEL_19:

    goto LABEL_20;
  }
  v10 = 0;
LABEL_20:

  return v10;
}

- (NSString)string2Value
{
  return self->_string2Value;
}

- (NSString)string2Name
{
  return self->_string2Name;
}

- (NSString)string1Value
{
  return self->_string1Value;
}

- (NSString)string1Name
{
  return self->_string1Name;
}

- (NSString)number1Name
{
  return self->_number1Name;
}

- (NSNumber)number1Value
{
  return self->_number1Value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_number2Value, 0);
  objc_storeStrong((id *)&self->_number2Name, 0);
  objc_storeStrong((id *)&self->_number1Value, 0);
  objc_storeStrong((id *)&self->_number1Name, 0);
  objc_storeStrong((id *)&self->_string2Value, 0);
  objc_storeStrong((id *)&self->_string2Name, 0);
  objc_storeStrong((id *)&self->_string1Value, 0);
  objc_storeStrong((id *)&self->_string1Name, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (unint64_t)signpostId
{
  return self->_signpostId;
}

- (unint64_t)scope
{
  return self->_scope;
}

- (NSString)name
{
  return self->_name;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (SignpostObject)initWithSubsystem:(id)a3 category:(id)a4 name:(id)a5 signpostId:(unint64_t)a6 scope:(unint64_t)a7 timebaseRatio:(double)a8 attributes:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  SignpostObject *v20;
  SignpostObject *v21;
  objc_super v23;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a9;
  if (!v15)
    -[SignpostObject initWithSubsystem:category:name:signpostId:scope:timebaseRatio:attributes:].cold.1();
  if (!v17)
    -[SignpostObject initWithSubsystem:category:name:signpostId:scope:timebaseRatio:attributes:].cold.2();
  v19 = v18;
  v23.receiver = self;
  v23.super_class = (Class)SignpostObject;
  v20 = -[SignpostSupportObject initWithSubsystem:category:timebaseRatio:](&v23, sel_initWithSubsystem_category_timebaseRatio_, v15, v16, a8);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_name, a5);
    v21->_signpostId = a6;
    objc_storeStrong((id *)&v21->_attributes, a9);
  }

  return v21;
}

- (void)setTelemetryEnabled:(BOOL)a3
{
  self->_telemetryEnabled = a3;
}

- (void)setString1Value:(id)a3
{
  objc_storeStrong((id *)&self->_string1Value, a3);
}

- (void)setString1Name:(id)a3
{
  objc_storeStrong((id *)&self->_string1Name, a3);
}

- (void)setNumber2Value:(id)a3
{
  objc_storeStrong((id *)&self->_number2Value, a3);
}

- (void)setNumber2Name:(id)a3
{
  objc_storeStrong((id *)&self->_number2Name, a3);
}

- (void)setNumber1Value:(id)a3
{
  objc_storeStrong((id *)&self->_number1Value, a3);
}

- (void)setNumber1Name:(id)a3
{
  objc_storeStrong((id *)&self->_number1Name, a3);
}

- (void)setString2Value:(id)a3
{
  objc_storeStrong((id *)&self->_string2Value, a3);
}

- (void)setString2Name:(id)a3
{
  objc_storeStrong((id *)&self->_string2Name, a3);
}

+ (id)serializationTypeNumber
{
  __assert_rtn("+[SignpostObject(Serialization) serializationTypeNumber]", "SignpostSupportDeserialization.m", 495, "false");
}

- (id)_dictionaryRepresentationWithIsHumanReadable:(BOOL)a3 shouldRedact:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  const __CFString *v37;
  void *v38;
  objc_super v40;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)SignpostObject;
  -[SignpostSupportObject _dictionaryRepresentationWithIsHumanReadable:shouldRedact:](&v40, sel__dictionaryRepresentationWithIsHumanReadable_shouldRedact_, a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SignpostObject signpostId](self, "signpostId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v8 = CFSTR("SignpostID");
  else
    v8 = CFSTR("ID");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, v8);

  if (v4)
  {
    -[SignpostObject scopeString](self, "scopeString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("SignpostScope"));
    v10 = CFSTR("TelemetryEnabled");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SignpostObject scope](self, "scope"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("Scope"));
    v10 = CFSTR("TelEn");
  }

  -[SignpostObject name](self, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("Name"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SignpostObject telemetryEnabled](self, "telemetryEnabled"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v10);

  -[SignpostObject attributes](self, "attributes");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[SignpostObject attributes](self, "attributes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16)
    {
      -[SignpostObject attributes](self, "attributes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
        v18 = CFSTR("AttributeDictionary");
      else
        v18 = CFSTR("AttDict");
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, v18);

    }
  }
  -[SignpostObject string1Name](self, "string1Name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[SignpostObject string1Name](self, "string1Name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v21 = CFSTR("String1Name");
    else
      v21 = CFSTR("Str1Name");
    if (v4)
      v22 = CFSTR("String1Value");
    else
      v22 = CFSTR("Str1Val");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, v21);

    -[SignpostObject string1Value](self, "string1Value");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v23, v22);

  }
  -[SignpostObject string2Name](self, "string2Name");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[SignpostObject string2Name](self, "string2Name");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v26 = CFSTR("String2Name");
    else
      v26 = CFSTR("Str2Name");
    if (v4)
      v27 = CFSTR("String2Value");
    else
      v27 = CFSTR("Str2Val");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v25, v26);

    -[SignpostObject string2Value](self, "string2Value");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v28, v27);

  }
  -[SignpostObject number1Name](self, "number1Name");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[SignpostObject number1Name](self, "number1Name");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v31 = CFSTR("Number1Name");
    else
      v31 = CFSTR("Hist1Name");
    if (v4)
      v32 = CFSTR("Number1Value");
    else
      v32 = CFSTR("Hist1Val");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v30, v31);

    -[SignpostObject number1Value](self, "number1Value");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v33, v32);

  }
  -[SignpostObject number2Name](self, "number2Name");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[SignpostObject number2Name](self, "number2Name");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v36 = CFSTR("Number2Name");
    else
      v36 = CFSTR("Hist2Name");
    if (v4)
      v37 = CFSTR("Number2Value");
    else
      v37 = CFSTR("Hist2Val");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v35, v36);

    -[SignpostObject number2Value](self, "number2Value");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v38, v37);

  }
  return v6;
}

- (SignpostObject)initWithDictionary:(id)a3
{
  id v4;
  SignpostObject *v5;
  SignpostObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v4 = a3;
  if (!v4)
    goto LABEL_11;
  v23.receiver = self;
  v23.super_class = (Class)SignpostObject;
  self = -[SignpostSupportObject initWithDictionary:](&v23, sel_initWithDictionary_, v4);
  if (!self)
  {
LABEL_9:
    self = self;
    v6 = self;
    goto LABEL_12;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ID"));
  v5 = (SignpostObject *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    -[SignpostObject setSignpostId:](self, "setSignpostId:", -[SignpostObject unsignedLongLongValue](v5, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Scope"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      -[SignpostObject setScope:](self, "setScope:", objc_msgSend(v7, "unsignedIntegerValue"));
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Name"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SignpostObject setName:](self, "setName:", v9);

      -[SignpostObject name](self, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TelEn"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
          -[SignpostObject setTelemetryEnabled:](self, "setTelemetryEnabled:", objc_msgSend(v11, "BOOLValue"));
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AttDict"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SignpostObject setAttributes:](self, "setAttributes:", v13);

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Str1Name"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[SignpostObject setString1Name:](self, "setString1Name:", v14);

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Str1Val"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SignpostObject setString1Value:](self, "setString1Value:", v15);

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Str2Name"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[SignpostObject setString2Name:](self, "setString2Name:", v16);

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Str2Val"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SignpostObject setString2Value:](self, "setString2Value:", v17);

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Hist1Name"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SignpostObject setNumber1Name:](self, "setNumber1Name:", v18);

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Hist1Val"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[SignpostObject setNumber1Value:](self, "setNumber1Value:", v19);

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Hist2Name"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[SignpostObject setNumber2Name:](self, "setNumber2Name:", v20);

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Hist2Val"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[SignpostObject setNumber2Value:](self, "setNumber2Value:", v21);

        goto LABEL_9;
      }
    }

LABEL_11:
    v6 = 0;
  }
LABEL_12:

  return v6;
}

- (id)_descriptionStringForColumn:(unint64_t)a3 timeFormat:(unint64_t)a4 asBegin:(BOOL)a5
{
  void *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  _BOOL4 v17;
  __CFString *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)SignpostObject;
  -[SignpostSupportObject _descriptionStringForColumn:timeFormat:asBegin:](&v20, sel__descriptionStringForColumn_timeFormat_asBegin_, a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    v10 = 0;
    switch(a3)
    {
      case 6uLL:
        -[SignpostObject name](self, "name");
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
      case 0xBuLL:
        if (-[SignpostObject signpostId](self, "signpostId") == 0xEEEEB0B5B2B2EEEELL
          || -[SignpostObject signpostId](self, "signpostId") == 0xCABA71571CC0FFEELL)
        {
          v10 = CFSTR("ID_EXCLUSIVE");
          goto LABEL_4;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%#llx"), -[SignpostObject signpostId](self, "signpostId"));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
      case 0xCuLL:
        v16 = -[SignpostObject scope](self, "scope");
        if (v16 > 2)
          v10 = CFSTR("UNKNOWN");
        else
          v10 = *(&off_1E4601990 + v16);
        goto LABEL_4;
      case 0xDuLL:
        v17 = -[SignpostObject telemetryEnabled](self, "telemetryEnabled");
        v18 = CFSTR("Disabled");
        if (v17)
          v18 = CFSTR("Enabled");
        v9 = v18;
        break;
      case 0xEuLL:
        -[SignpostObject string1Name](self, "string1Name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
          goto LABEL_24;
        v13 = (void *)MEMORY[0x1E0CB3940];
        -[SignpostObject string1Name](self, "string1Name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[SignpostObject string1Value](self, "string1Value");
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      case 0xFuLL:
        -[SignpostObject string2Name](self, "string2Name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
          goto LABEL_24;
        v13 = (void *)MEMORY[0x1E0CB3940];
        -[SignpostObject string2Name](self, "string2Name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[SignpostObject string2Value](self, "string2Value");
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      case 0x10uLL:
        -[SignpostObject number1Name](self, "number1Name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
          goto LABEL_24;
        v13 = (void *)MEMORY[0x1E0CB3940];
        -[SignpostObject number1Name](self, "number1Name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[SignpostObject number1Value](self, "number1Value");
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      case 0x11uLL:
        -[SignpostObject number2Name](self, "number2Name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)MEMORY[0x1E0CB3940];
          -[SignpostObject number2Name](self, "number2Name");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[SignpostObject number2Value](self, "number2Value");
          v15 = objc_claimAutoreleasedReturnValue();
LABEL_23:
          v19 = (void *)v15;
          objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ = %@"), v14, v15);
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
LABEL_24:
          v10 = 0;
        }

        goto LABEL_4;
      default:
        goto LABEL_4;
    }
  }
  v10 = v9;
LABEL_4:

  return v10;
}

- (NSString)scopeString
{
  unint64_t v2;

  v2 = -[SignpostObject scope](self, "scope");
  if (v2 > 2)
    return (NSString *)CFSTR("UNKNOWN");
  else
    return (NSString *)*(&off_1E4601990 + v2);
}

- (BOOL)telemetryEnabled
{
  return self->_telemetryEnabled;
}

- (void)setAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_attributes, a3);
}

- (NSString)number2Name
{
  return self->_number2Name;
}

- (NSNumber)number2Value
{
  return self->_number2Value;
}

- (void)initWithSubsystem:category:name:signpostId:scope:timebaseRatio:attributes:.cold.1()
{
  __assert_rtn("-[SignpostObject initWithSubsystem:category:name:signpostId:scope:timebaseRatio:attributes:]", "SignpostSupportObject.m", 745, "subsystem");
}

- (void)initWithSubsystem:category:name:signpostId:scope:timebaseRatio:attributes:.cold.2()
{
  __assert_rtn("-[SignpostObject initWithSubsystem:category:name:signpostId:scope:timebaseRatio:attributes:]", "SignpostSupportObject.m", 746, "name");
}

@end
