@implementation STTemperature

- (id)_initWithValue:(double)a3 units:(int64_t)a4
{
  id result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STTemperature;
  result = -[STTemperature init](&v7, sel_init);
  if (result)
  {
    *((double *)result + 2) = a3;
    *((_QWORD *)result + 3) = a4;
  }
  return result;
}

- (double)value
{
  return self->_value;
}

- (int64_t)units
{
  return self->_units;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STTemperature;
  v4 = a3;
  -[STSiriModelObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_value"), self->_value, v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_units, CFSTR("_units"));

}

- (STTemperature)initWithCoder:(id)a3
{
  id v4;
  STTemperature *v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)STTemperature;
  v5 = -[STSiriModelObject initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_value"));
    v5->_value = v6;
    v5->_units = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_units"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
