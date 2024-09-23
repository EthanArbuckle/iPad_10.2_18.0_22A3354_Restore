@implementation PETEventProperty

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)propertyWithName:(id)a3 possibleValues:(id)a4
{
  return +[PETEventProperty propertyWithName:possibleValues:autoSanitizeValues:](PETEventProperty, "propertyWithName:possibleValues:autoSanitizeValues:", a3, a4, 1);
}

+ (id)propertyWithName:(id)a3 possibleValues:(id)a4 autoSanitizeValues:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  PETEventStringValuedProperty *v9;
  void *v10;
  PETEventStringValuedProperty *v11;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = [PETEventStringValuedProperty alloc];
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v7);

  v11 = -[PETEventStringValuedProperty initWithName:possibleValues:autoSanitizeValues:](v9, "initWithName:possibleValues:autoSanitizeValues:", v8, v10, v5);
  return v11;
}

- (PETEventProperty)initWithName:(id)a3
{
  id v4;
  PETEventProperty *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *name;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PETEventProperty;
  v5 = -[PETEventProperty init](&v12, sel_init);
  if (v5)
  {
    if (!+[PETEventStringValidator stringIsValid:](PETEventStringValidator, "stringIsValid:", v4))
    {
      v6 = (void *)MEMORY[0x1E0C99DA0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("property name may only contain [a-zA-Z0-9_] and may not be prefixed with _: %@"), v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "exceptionWithName:reason:userInfo:", CFSTR("PETEventTrackingException"), v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "raise");
    }
    v9 = objc_msgSend(v4, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v9;

  }
  return v5;
}

- (BOOL)isValidValue:(id)a3
{
  return 0;
}

- (id)_loggingKeyStringRepresentationForValue:(id)a3
{
  return 0;
}

- (unint64_t)cardinality
{
  return 1000;
}

- (NSString)longestValueString
{
  return 0;
}

- (id)possibleValues
{
  return 0;
}

- (_NSRange)validRange
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = 0;
  v3 = 0;
  result.length = v3;
  result.location = v2;
  return result;
}

+ (id)propertyWithName:(id)a3 enumMapping:(id)a4
{
  return +[PETEventProperty propertyWithName:enumMapping:autoSanitizeValues:](PETEventProperty, "propertyWithName:enumMapping:autoSanitizeValues:", a3, a4, 1);
}

+ (id)propertyWithName:(id)a3 enumMapping:(id)a4 autoSanitizeValues:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  PETEventEnumMappedProperty *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = -[PETEventEnumMappedProperty initWithName:enumMapping:autoSanitizeValues:]([PETEventEnumMappedProperty alloc], "initWithName:enumMapping:autoSanitizeValues:", v8, v7, v5);

  return v9;
}

+ (id)propertyWithName:(id)a3 range:(_NSRange)a4 clampValues:(BOOL)a5
{
  _BOOL8 v5;
  NSUInteger length;
  NSUInteger location;
  id v8;
  PETEventNumericalProperty *v9;

  v5 = a5;
  length = a4.length;
  location = a4.location;
  v8 = a3;
  v9 = -[PETEventNumericalProperty initWithName:range:clampValues:]([PETEventNumericalProperty alloc], "initWithName:range:clampValues:", v8, location, length, v5);

  return v9;
}

+ (id)propertyWithName:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  void *v7;

  length = a4.length;
  location = a4.location;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "propertyWithName:range:clampValues:", v6, location, length, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)propertyWithName:(id)a3 rangeMin:(unint64_t)a4 rangeMax:(unint64_t)a5
{
  id v7;
  void *v8;

  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "propertyWithName:range:clampValues:", v7, a4, a5 - a4 + 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)freeValuedPropertyWithName:(id)a3
{
  id v3;
  PETEventFreeValuedProperty *v4;

  v3 = a3;
  v4 = -[PETEventFreeValuedProperty initWithName:]([PETEventFreeValuedProperty alloc], "initWithName:", v3);

  return v4;
}

@end
