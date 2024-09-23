@implementation WFRowTemplateValue

- (WFRowTemplateValue)initWithContentItemClass:(Class)a3 contentPropertyName:(id)a4 comparisonOperator:(int64_t)a5 removable:(BOOL)a6
{
  id v10;
  WFRowTemplateValue *v11;
  WFRowTemplateValue *v12;
  uint64_t v13;
  NSString *contentPropertyName;
  WFRowTemplateValue *v15;
  objc_super v17;

  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WFRowTemplateValue;
  v11 = -[WFRowTemplateValue init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_contentItemClass, a3);
    v13 = objc_msgSend(v10, "copy");
    contentPropertyName = v12->_contentPropertyName;
    v12->_contentPropertyName = (NSString *)v13;

    v12->_comparisonOperator = a5;
    v12->_removable = a6;
    v15 = v12;
  }

  return v12;
}

- (WFRowTemplateValue)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  Class v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  WFRowTemplateValue *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *enumeration;
  uint64_t v20;
  NSString *string;
  uint64_t v22;
  NSNumber *BOOLean;
  uint64_t v24;
  NSNumber *number;
  uint64_t v26;
  NSString *phone;
  uint64_t v28;
  NSString *email;
  uint64_t v30;
  NSNumber *calendarUnit;
  uint64_t v32;
  NSNumber *byteCountUnit;
  uint64_t v34;
  NSUnit *measurementUnit;
  uint64_t v36;
  NSDate *date;
  uint64_t v38;
  NSDate *anotherDate;
  WFRowTemplateValue *v40;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentItemClass"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  v6 = NSClassFromString(v5);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentPropertyName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("comparisonOperator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("removable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  v12 = -[WFRowTemplateValue initWithContentItemClass:contentPropertyName:comparisonOperator:removable:](self, "initWithContentItemClass:contentPropertyName:comparisonOperator:removable:", v6, v7, v9, v11);
  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, v15, v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("enumeration"));
    v18 = objc_claimAutoreleasedReturnValue();
    enumeration = v12->_enumeration;
    v12->_enumeration = v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("string"));
    v20 = objc_claimAutoreleasedReturnValue();
    string = v12->_string;
    v12->_string = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BOOLean"));
    v22 = objc_claimAutoreleasedReturnValue();
    BOOLean = v12->_BOOLean;
    v12->_BOOLean = (NSNumber *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("number"));
    v24 = objc_claimAutoreleasedReturnValue();
    number = v12->_number;
    v12->_number = (NSNumber *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phone"));
    v26 = objc_claimAutoreleasedReturnValue();
    phone = v12->_phone;
    v12->_phone = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("email"));
    v28 = objc_claimAutoreleasedReturnValue();
    email = v12->_email;
    v12->_email = (NSString *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("calendarUnit"));
    v30 = objc_claimAutoreleasedReturnValue();
    calendarUnit = v12->_calendarUnit;
    v12->_calendarUnit = (NSNumber *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("byteCountUnit"));
    v32 = objc_claimAutoreleasedReturnValue();
    byteCountUnit = v12->_byteCountUnit;
    v12->_byteCountUnit = (NSNumber *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("measurementUnit"));
    v34 = objc_claimAutoreleasedReturnValue();
    measurementUnit = v12->_measurementUnit;
    v12->_measurementUnit = (NSUnit *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v36 = objc_claimAutoreleasedReturnValue();
    date = v12->_date;
    v12->_date = (NSDate *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("anotherDate"));
    v38 = objc_claimAutoreleasedReturnValue();
    anotherDate = v12->_anotherDate;
    v12->_anotherDate = (NSDate *)v38;

    v40 = v12;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  objc_class *contentItemClass;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  contentItemClass = self->_contentItemClass;
  v8 = a3;
  NSStringFromClass(contentItemClass);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("contentItemClass"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_contentPropertyName, CFSTR("contentPropertyName"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_comparisonOperator);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("comparisonOperator"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_removable);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("removable"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_enumeration, CFSTR("enumeration"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_string, CFSTR("string"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_BOOLean, CFSTR("BOOLean"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_number, CFSTR("number"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_phone, CFSTR("phone"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_email, CFSTR("email"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_calendarUnit, CFSTR("calendarUnit"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_byteCountUnit, CFSTR("byteCountUnit"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_measurementUnit, CFSTR("measurementUnit"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_date, CFSTR("date"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_anotherDate, CFSTR("anotherDate"));

}

- (Class)contentItemClass
{
  return self->_contentItemClass;
}

- (NSString)contentPropertyName
{
  return self->_contentPropertyName;
}

- (int64_t)comparisonOperator
{
  return self->_comparisonOperator;
}

- (BOOL)removable
{
  return self->_removable;
}

- (NSObject)enumeration
{
  return self->_enumeration;
}

- (void)setEnumeration:(id)a3
{
  objc_storeStrong((id *)&self->_enumeration, a3);
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
  objc_storeStrong((id *)&self->_string, a3);
}

- (NSNumber)BOOLean
{
  return self->_BOOLean;
}

- (void)setBoolean:(id)a3
{
  objc_storeStrong((id *)&self->_BOOLean, a3);
}

- (NSNumber)number
{
  return self->_number;
}

- (void)setNumber:(id)a3
{
  objc_storeStrong((id *)&self->_number, a3);
}

- (NSString)phone
{
  return self->_phone;
}

- (void)setPhone:(id)a3
{
  objc_storeStrong((id *)&self->_phone, a3);
}

- (NSString)email
{
  return self->_email;
}

- (void)setEmail:(id)a3
{
  objc_storeStrong((id *)&self->_email, a3);
}

- (NSNumber)calendarUnit
{
  return self->_calendarUnit;
}

- (void)setCalendarUnit:(id)a3
{
  objc_storeStrong((id *)&self->_calendarUnit, a3);
}

- (NSNumber)byteCountUnit
{
  return self->_byteCountUnit;
}

- (void)setByteCountUnit:(id)a3
{
  objc_storeStrong((id *)&self->_byteCountUnit, a3);
}

- (NSUnit)measurementUnit
{
  return self->_measurementUnit;
}

- (void)setMeasurementUnit:(id)a3
{
  objc_storeStrong((id *)&self->_measurementUnit, a3);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (NSDate)anotherDate
{
  return self->_anotherDate;
}

- (void)setAnotherDate:(id)a3
{
  objc_storeStrong((id *)&self->_anotherDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anotherDate, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_measurementUnit, 0);
  objc_storeStrong((id *)&self->_byteCountUnit, 0);
  objc_storeStrong((id *)&self->_calendarUnit, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_phone, 0);
  objc_storeStrong((id *)&self->_number, 0);
  objc_storeStrong((id *)&self->_BOOLean, 0);
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_enumeration, 0);
  objc_storeStrong((id *)&self->_contentPropertyName, 0);
  objc_storeStrong((id *)&self->_contentItemClass, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
