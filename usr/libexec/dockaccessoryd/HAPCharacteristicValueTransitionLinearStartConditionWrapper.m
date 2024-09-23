@implementation HAPCharacteristicValueTransitionLinearStartConditionWrapper

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPCharacteristicValueTransitionLinearStartConditionWrapper *v6;
  HAPCharacteristicValueTransitionLinearStartConditionWrapper *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPCharacteristicValueTransitionLinearStartConditionWrapper);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPCharacteristicValueTransitionLinearStartConditionWrapper parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
    v8 = v10;
    if (v8)
    {

      v7 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v8);
    }

  }
  return v7;
}

- (HAPCharacteristicValueTransitionLinearStartConditionWrapper)init
{
  HAPCharacteristicValueTransitionLinearStartConditionWrapper *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPCharacteristicValueTransitionLinearStartConditionWrapper;
  result = -[HAPCharacteristicValueTransitionLinearStartConditionWrapper init](&v3, "init");
  if (result)
    result->_value = 0;
  return result;
}

- (HAPCharacteristicValueTransitionLinearStartConditionWrapper)initWithValue:(int64_t)a3
{
  HAPCharacteristicValueTransitionLinearStartConditionWrapper *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HAPCharacteristicValueTransitionLinearStartConditionWrapper;
  result = -[HAPCharacteristicValueTransitionLinearStartConditionWrapper init](&v5, "init");
  if (result)
    result->_value = a3;
  return result;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  BOOL v9;
  id v10;
  id v11;
  unsigned int v13;

  v6 = a3;
  if (!objc_msgSend(v6, "length"))
  {
    if (!a4)
    {
      v9 = 0;
      goto LABEL_10;
    }
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", HMFErrorDomain, 3, 0));
    v9 = 0;
    goto LABEL_7;
  }
  v13 = 0;
  v7 = objc_retainAutorelease(v6);
  v8 = sub_100022530((unsigned __int8 *)objc_msgSend(v7, "bytes"), (uint64_t)objc_msgSend(v7, "length"), (int *)&v13);
  v9 = v13 == 0;
  if (!v13)
  {
    -[HAPCharacteristicValueTransitionLinearStartConditionWrapper setValue:](self, "setValue:", v8);
    goto LABEL_10;
  }
  if (a4)
  {
    v10 = sub_100040DDC(v13);
    v11 = (id)objc_claimAutoreleasedReturnValue(v10);
LABEL_7:
    *a4 = v11;
  }
LABEL_10:

  return v9;
}

- (id)serializeWithError:(id *)a3
{
  return sub_1000225E0(-[HAPCharacteristicValueTransitionLinearStartConditionWrapper value](self, "value", a3));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HAPCharacteristicValueTransitionLinearStartConditionWrapper initWithValue:](+[HAPCharacteristicValueTransitionLinearStartConditionWrapper allocWithZone:](HAPCharacteristicValueTransitionLinearStartConditionWrapper, "allocWithZone:", a3), "initWithValue:", -[HAPCharacteristicValueTransitionLinearStartConditionWrapper value](self, "value"));
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  HAPCharacteristicValueTransitionLinearStartConditionWrapper *v5;
  uint64_t v6;
  HAPCharacteristicValueTransitionLinearStartConditionWrapper *v7;
  int64_t v8;
  int64_t v9;
  BOOL v10;

  v5 = (HAPCharacteristicValueTransitionLinearStartConditionWrapper *)a3;
  if (self == v5)
  {
    v10 = 1;
  }
  else
  {
    v6 = objc_opt_class(HAPCharacteristicValueTransitionLinearStartConditionWrapper, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      v8 = -[HAPCharacteristicValueTransitionLinearStartConditionWrapper value](self, "value");
      v9 = -[HAPCharacteristicValueTransitionLinearStartConditionWrapper value](v7, "value");

      v10 = v8 == v9;
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (NSString)description
{
  __CFString *started;
  void *v3;
  void *v4;

  started = HAPCharacteristicValueTransitionLinearStartConditionAsString(-[HAPCharacteristicValueTransitionLinearStartConditionWrapper value](self, "value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(started);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<HAPCharacteristicValueTransitionLinearStartConditionWrapper value=%@>"), v3));

  return (NSString *)v4;
}

- (int64_t)value
{
  return self->_value;
}

- (void)setValue:(int64_t)a3
{
  self->_value = a3;
}

@end
