@implementation TIStatisticChange

- (TIStatisticChange)initWithName:(id)a3 andValue:(int)a4 andInputMode:(id)a5
{
  id v9;
  id v10;
  TIStatisticChange *v11;
  TIStatisticChange *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TIStatisticChange;
  v11 = -[TIStatisticChange init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a3);
    v12->_value = a4;
    objc_storeStrong((id *)&v12->_inputMode, a5);
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TIStatisticChange *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *inputMode;

  v5 = objc_alloc_init(TIStatisticChange);
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_value = self->_value;
    v8 = -[NSString copyWithZone:](self->_inputMode, "copyWithZone:", a3);
    inputMode = v5->_inputMode;
    v5->_inputMode = (NSString *)v8;

  }
  return v5;
}

- (TIStatisticChange)initWithCoder:(id)a3
{
  id v4;
  TIStatisticChange *v5;
  void *v6;
  uint64_t v7;
  NSString *name;
  void *v9;
  uint64_t v10;
  NSString *inputMode;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TIStatisticChange;
  v5 = -[TIStatisticChange init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v7;

    v5->_value = objc_msgSend(v4, "decodeIntForKey:", CFSTR("value"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputMode"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    inputMode = v5->_inputMode;
    v5->_inputMode = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *name;
  uint64_t value;
  NSString *inputMode;
  id v8;

  v4 = a3;
  name = self->_name;
  v8 = v4;
  if (name)
  {
    objc_msgSend(v4, "encodeObject:forKey:", name, CFSTR("name"));
    v4 = v8;
  }
  value = self->_value;
  if ((_DWORD)value)
  {
    objc_msgSend(v8, "encodeInt:forKey:", value, CFSTR("value"));
    v4 = v8;
  }
  inputMode = self->_inputMode;
  if (inputMode)
  {
    objc_msgSend(v8, "encodeObject:forKey:", inputMode, CFSTR("inputMode"));
    v4 = v8;
  }

}

- (NSString)name
{
  return self->_name;
}

- (int)value
{
  return self->_value;
}

- (NSString)inputMode
{
  return self->_inputMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputMode, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)statisticChangeWithName:(id)a3 andValue:(int)a4 andInputMode:(id)a5
{
  uint64_t v5;
  id v7;
  id v8;
  TIStatisticChange *v9;

  v5 = *(_QWORD *)&a4;
  v7 = a5;
  v8 = a3;
  v9 = -[TIStatisticChange initWithName:andValue:andInputMode:]([TIStatisticChange alloc], "initWithName:andValue:andInputMode:", v8, v5, v7);

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
