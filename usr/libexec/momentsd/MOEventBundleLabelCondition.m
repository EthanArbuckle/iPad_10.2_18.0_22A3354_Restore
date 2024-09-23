@implementation MOEventBundleLabelCondition

- (MOEventBundleLabelCondition)initWithKeyword:(id)a3
{
  id v6;
  MOEventBundleLabelCondition *v7;
  MOEventBundleLabelCondition *v8;
  NSString *value;
  NSArray *values;
  MOEventBundleLabelCondition *v11;
  id os_log;
  NSObject *v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  if (v6)
  {
    v16.receiver = self;
    v16.super_class = (Class)MOEventBundleLabelCondition;
    v7 = -[MOEventBundleLabelCondition init](&v16, "init");
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_keyword, a3);
      value = v8->_value;
      v8->_templateOperator = 0;
      v8->_value = 0;

      values = v8->_values;
      v8->_values = 0;

      v8->_valueType = 0;
      v8->_capitalized = 0;
    }
    self = v8;
    v11 = self;
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MOEventBundleLabelCondition initWithKeyword:].cold.1(v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEventBundleLabelCondition.m"), 23, CFSTR("Invalid parameter not satisfying: keyword"));

    v11 = 0;
  }

  return v11;
}

- (BOOL)isNumeric:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init((Class)NSNumberFormatter);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "numberFromString:", v3));

  return v5 != 0;
}

- (BOOL)yieldPresenceCheckForValueData:(id)a3
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  unsigned __int8 v8;
  uint64_t v9;
  BOOL v10;

  v4 = a3;
  if (!v4)
    goto LABEL_9;
  v5 = objc_opt_class(NSString, v3);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v7 = v4;
    if (objc_msgSend(v7, "length"))
    {
      v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("NO"));

      if ((v8 & 1) == 0)
        goto LABEL_5;
    }
    else
    {

    }
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
LABEL_5:
  v9 = objc_opt_class(NSNumber, v6);
  if ((objc_opt_isKindOfClass(v4, v9) & 1) != 0 && !objc_msgSend(v4, "BOOLValue"))
    goto LABEL_9;
  v10 = 1;
LABEL_10:

  return v10;
}

- (BOOL)yieldConditionForMetaData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  void *v12;
  unsigned int v13;
  void *v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleLabelCondition keyword](self, "keyword"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v5));

  if ((id)-[MOEventBundleLabelCondition templateOperator](self, "templateOperator") != (id)9)
  {
    v11 = -[MOEventBundleLabelCondition yieldConditionForValueData:](self, "yieldConditionForValueData:", v6);
    goto LABEL_10;
  }
  if (!v6)
  {
LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  v7 = objc_claimAutoreleasedReturnValue(-[MOEventBundleLabelCondition value](self, "value"));
  if (!v7
    || (v8 = (void *)v7,
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleLabelCondition value](self, "value")),
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("_ANY_")),
        v9,
        v8,
        (v10 & 1) == 0))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleLabelCondition values](self, "values"));
    v13 = objc_msgSend(v12, "containsObject:", v6);

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v6));
      v11 = v14 != 0;

      goto LABEL_10;
    }
    goto LABEL_9;
  }
  v11 = 1;
LABEL_10:

  return v11;
}

- (BOOL)yieldConditionForValueData:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSNumberFormatter *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  id v19;
  BOOL v20;
  id v21;
  BOOL v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleLabelCondition value](self, "value"));

  if (v5)
  {
    if (v4)
    {
      v7 = objc_opt_class(NSString, v6);
      if ((objc_opt_isKindOfClass(v4, v7) & 1) != 0)
      {
        v9 = (NSNumberFormatter *)v4;
        if (!-[NSNumberFormatter length](v9, "length"))
        {
LABEL_9:
          LOBYTE(self) = 0;
LABEL_46:

          goto LABEL_47;
        }
        if ((id)-[MOEventBundleLabelCondition templateOperator](self, "templateOperator") == (id)1
          && !-[MOEventBundleLabelCondition valueType](self, "valueType"))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleLabelCondition value](self, "value"));
          LOBYTE(self) = objc_msgSend(v13, "isEqualToString:", v9);
        }
        else
        {
          if ((id)-[MOEventBundleLabelCondition templateOperator](self, "templateOperator") != (id)2
            || -[MOEventBundleLabelCondition valueType](self, "valueType"))
          {
            goto LABEL_9;
          }
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleLabelCondition value](self, "value"));
          LODWORD(self) = objc_msgSend(v13, "isEqualToString:", v9) ^ 1;
        }
LABEL_45:

        goto LABEL_46;
      }
      v11 = objc_opt_class(NSNumber, v8);
      if ((objc_opt_isKindOfClass(v4, v11) & 1) != 0)
      {
        v9 = objc_opt_new(NSNumberFormatter);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleLabelCondition value](self, "value"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumberFormatter numberFromString:](v9, "numberFromString:", v12));

        v14 = v4;
        if ((id)-[MOEventBundleLabelCondition valueType](self, "valueType") == (id)1)
        {
          switch(-[MOEventBundleLabelCondition templateOperator](self, "templateOperator"))
          {
            case 1uLL:
              self = (MOEventBundleLabelCondition *)objc_msgSend(v14, "integerValue");
              LOBYTE(self) = self == objc_msgSend(v13, "integerValue");
              break;
            case 2uLL:
              self = (MOEventBundleLabelCondition *)objc_msgSend(v14, "integerValue");
              LOBYTE(self) = self != objc_msgSend(v13, "integerValue");
              break;
            case 3uLL:
              self = (MOEventBundleLabelCondition *)objc_msgSend(v14, "integerValue");
              LOBYTE(self) = (uint64_t)self < (uint64_t)objc_msgSend(v13, "integerValue");
              break;
            case 4uLL:
              self = (MOEventBundleLabelCondition *)objc_msgSend(v14, "integerValue");
              LOBYTE(self) = (uint64_t)self <= (uint64_t)objc_msgSend(v13, "integerValue");
              break;
            case 5uLL:
              v19 = objc_msgSend(v14, "integerValue");
              v20 = (uint64_t)v19 <= (uint64_t)objc_msgSend(v13, "integerValue");
              goto LABEL_37;
            case 6uLL:
              v21 = objc_msgSend(v14, "integerValue");
              v22 = (uint64_t)v21 < (uint64_t)objc_msgSend(v13, "integerValue");
              goto LABEL_41;
            default:
              goto LABEL_24;
          }
LABEL_44:

          goto LABEL_45;
        }
        if ((id)-[MOEventBundleLabelCondition valueType](self, "valueType") == (id)2
          || !-[MOEventBundleLabelCondition valueType](self, "valueType"))
        {
          switch(-[MOEventBundleLabelCondition templateOperator](self, "templateOperator"))
          {
            case 1uLL:
              objc_msgSend(v14, "doubleValue");
              v16 = v15;
              objc_msgSend(v13, "doubleValue");
              v18 = vabdd_f64(v16, v17) < 0.0001;
              goto LABEL_32;
            case 2uLL:
              objc_msgSend(v14, "doubleValue");
              v24 = v23;
              objc_msgSend(v13, "doubleValue");
              v22 = vabdd_f64(v24, v25) < 0.0001;
              goto LABEL_41;
            case 3uLL:
              objc_msgSend(v14, "doubleValue");
              v27 = v26;
              objc_msgSend(v13, "doubleValue");
              v18 = v27 < v28;
LABEL_32:
              LOBYTE(self) = v18;
              goto LABEL_44;
            case 4uLL:
              objc_msgSend(v14, "doubleValue");
              v30 = v29;
              objc_msgSend(v13, "doubleValue");
              LOBYTE(self) = v30 <= v31;
              goto LABEL_44;
            case 5uLL:
              objc_msgSend(v14, "doubleValue");
              v33 = v32;
              objc_msgSend(v13, "doubleValue");
              v20 = v33 <= v34;
LABEL_37:
              LOBYTE(self) = !v20;
              goto LABEL_44;
            case 6uLL:
              objc_msgSend(v14, "doubleValue");
              v36 = v35;
              objc_msgSend(v13, "doubleValue");
              v22 = v36 < v37;
LABEL_41:
              LOBYTE(self) = !v22;
              break;
            default:
LABEL_24:
              LOBYTE(self) = 0;
              break;
          }
          goto LABEL_44;
        }

      }
      LOBYTE(self) = 0;
    }
    else
    {
      LOBYTE(self) = (id)-[MOEventBundleLabelCondition templateOperator](self, "templateOperator") == (id)2;
    }
  }
  else
  {
    v10 = -[MOEventBundleLabelCondition yieldPresenceCheckForValueData:](self, "yieldPresenceCheckForValueData:", v4);
    LOBYTE(self) = v10 ^ ((id)-[MOEventBundleLabelCondition templateOperator](self, "templateOperator") == (id)8);
  }
LABEL_47:

  return (char)self;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleLabelCondition keyword](self, "keyword"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelCondition stringFromTemplateOperator:](MOEventBundleLabelCondition, "stringFromTemplateOperator:", -[MOEventBundleLabelCondition templateOperator](self, "templateOperator")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleLabelCondition value](self, "value"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelCondition stringFromValueType:](MOEventBundleLabelCondition, "stringFromValueType:", -[MOEventBundleLabelCondition valueType](self, "valueType")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("keyword, %@,  operator, %@, value, %@, value type, %@"), v3, v4, v5, v6));

  return v7;
}

+ (unint64_t)templateOperatorFromString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("=")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("==")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("!=")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("<")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("<=")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR(">")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR(">=")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("!")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR(":")))
  {
    v4 = 9;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)stringFromTemplateOperator:(unint64_t)a3
{
  if (a3 > 9)
    return CFSTR("invalid");
  else
    return off_1002AFCF8[a3];
}

+ (unint64_t)valueTypeFromString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("s")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("d")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("f")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)stringFromValueType:(unint64_t)a3
{
  if (a3 > 2)
    return CFSTR("invalid");
  else
    return off_1002AFD48[a3];
}

- (NSString)keyword
{
  return self->_keyword;
}

- (void)setKeyword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)templateOperator
{
  return self->_templateOperator;
}

- (void)setTemplateOperator:(unint64_t)a3
{
  self->_templateOperator = a3;
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)valueType
{
  return self->_valueType;
}

- (void)setValueType:(unint64_t)a3
{
  self->_valueType = a3;
}

- (BOOL)capitalized
{
  return self->_capitalized;
}

- (void)setCapitalized:(BOOL)a3
{
  self->_capitalized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_keyword, 0);
}

- (void)initWithKeyword:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: keyword", v1, 2u);
}

@end
